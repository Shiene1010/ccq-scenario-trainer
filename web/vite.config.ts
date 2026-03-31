import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  base: '/ccq-scenario-trainer/', // <-- GitHub Pages용
  plugins: [react()],
})
