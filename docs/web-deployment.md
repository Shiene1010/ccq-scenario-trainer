# Web 배포 가이드 (요약)

현재: web/ 디렉터리에 Vite + React 앱이 있고 로컬에서 http://localhost:5173 로 동작함. dist 빌드와 gh-pages 배포 확인됨.

1) GitHub Pages (gh-pages) 직접 배포
- vite.config.ts
  - `base: '/ccq-scenario-trainer/'` 설정 필수(리포 경로 배포 시).
- 빌드 및 배포
  ```bash
  cd web
  npm ci
  npm run build
  npx gh-pages -d dist
  ```
- 확인: https://Shiene1010.github.io/ccq-scenario-trainer/

2) package.json에 자동화 스크립트 추가(권장)
- scripts:
  - "predeploy": "npm run build"
  - "deploy": "gh-pages -d dist"
- 사용: npm run deploy

3) GitHub Actions → Pages 자동 배포 (push → main)
- 예시 워크플로(.github/workflows/gh-pages.yml):
  ```yaml
  name: Deploy to GitHub Pages
  on:
    push:
      branches: [ main ]
  jobs:
    build-and-deploy:
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v4
        - uses: actions/setup-node@v4
          with: { node-version: '18' }
        - run: npm ci
        - run: npm run build
        - uses: peaceiris/actions-gh-pages@v3
          with:
            github_token: ${{ secrets.GITHUB_TOKEN }}
            publish_dir: ./dist
  ```

4) Vercel / Netlify 사용 (더 간편)
- GitHub 리포 연동 → 빌드 명령 `npm run build`, 배포 디렉터리 `dist` 로 설정
- Vercel: 자동 빌드/배포 + 커스텀 도메인 지원

5) 문제 해결 체크리스트
- 자산 404: vite.config.ts의 base와 index.html 참조 경로 일치 여부 확인
- 잘못된 index.html(빈 페이지): dist/index.html 내용 확인
- gh-pages 브랜치 문제: `git branch -a | egrep gh-pages` 및 필요 시 `git push origin --delete gh-pages` 후 재배포
- 캐시 문제: 브라우저 캐시/CF 캐시(호스팅 사용하는 경우) 비우기

필요 시 제가 다음 작업을 자동으로 적용해 드립니다:
- .github/workflows/gh-pages.yml 추가 및 커밋/푸시
- web/package.json에 predeploy/deploy 스크립트 추가 및 재배포
- Vercel 연결 안내 및