# Development Best Practices Guide

This guide outlines the best practices for working with our tech stack: Astro, React, Vite, Tailwind CSS, and Nanostores.

## Project Structure

### Astro Pages and Components
- Place all pages in `src/pages/`
- Use `.astro` extension for Astro components
- Use `.tsx` extension for React components
- Keep components atomic and reusable
- Follow naming convention: PascalCase for components

```typescript
// Good
src/components/UserProfile.astro
src/components/react/Button.tsx

// Bad
src/components/user-profile.astro
src/components/react/button.jsx
```

### Asset Organization
- Place static assets in `public/`
- Place component-specific assets in `src/assets/`
- Use appropriate file formats:
  - SVG for icons and logos
  - WebP for images (with fallback)
  - WOFF2 for fonts

## Astro Best Practices

### Component Architecture
- Use Astro components for static/rarely updated content
- Use React components for interactive elements
- Leverage Astro's partial hydration with client directives

```astro
---
// Good
import StaticHeader from '../components/Header.astro';
import InteractiveForm from '../components/react/Form';
---

<StaticHeader />
<InteractiveForm client:visible />
```

### Performance
- Use `client:idle` for non-critical interactive components
- Use `client:visible` for components that need hydration when visible
- Use `client:load` only when immediate interactivity is required
- Implement image optimization using Astro's built-in tools

## React Best Practices

### Component Structure
- Keep components small and focused
- Use functional components with hooks
- Implement proper prop typing with TypeScript
- Use React.memo() for expensive computations

```typescript
// Good
interface ButtonProps {
  label: string;
  onClick: () => void;
}

const Button = ({ label, onClick }: ButtonProps) => {
  return <button onClick={onClick}>{label}</button>;
};

export default Button;
```

### State Management
- Use Nanostores for global state
- Use React hooks for local state
- Avoid prop drilling by using context or stores

## Nanostores Best Practices

### Store Organization
- Create stores in `src/stores/` directory
- Keep stores minimal and focused
- Use computed values for derived state
- Implement proper TypeScript types

```typescript
// Good
import { atom, computed } from 'nanostores';

interface User {
  id: string;
  name: string;
}

export const $user = atom<User | null>(null);
export const $isLoggedIn = computed($user, user => user !== null);
```

### Store Usage
- Use `useStore` hook in React components
- Subscribe to specific fields to prevent unnecessary re-renders
- Clean up subscriptions in useEffect cleanup function

## Tailwind CSS Best Practices

### Class Organization
- Use consistent class ordering:
  1. Layout (position, display, width, height)
  2. Spacing (margin, padding)
  3. Typography
  4. Visual (colors, backgrounds, borders)
  5. Interactive (hover, focus)
- Extract common patterns into components
- Use @apply for complex, reusable styles

```astro
<!-- Good -->
<button class="flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-md hover:bg-blue-700">
  Submit
</button>

<!-- Bad - inconsistent ordering -->
<button class="text-white hover:bg-blue-700 px-4 flex rounded-md bg-blue-600 items-center py-2 text-sm font-medium">
  Submit
</button>
```

### Custom Tailwind Configuration
- Define custom colors in `tailwind.config.js`
- Use semantic color names
- Extend rather than override default theme
- Define consistent spacing scale

## Vite Configuration

### Build Optimization
- Use dynamic imports for route-based code splitting
- Configure proper asset handling
- Implement environment variables correctly
- Enable build caching

```typescript
// vite.config.ts
export default defineConfig({
  build: {
    chunkSizeWarningLimit: 1000,
    rollupOptions: {
      output: {
        manualChunks: {
          vendor: ['react', 'react-dom'],
        },
      },
    },
  },
});
```

## TypeScript Best Practices

### Type Safety
- Enable strict mode in `tsconfig.json`
- Use proper type annotations
- Avoid `any` type
- Create dedicated type files for shared interfaces

### Type Organization
- Place shared types in `src/types/`
- Use interface for objects
- Use type for unions/intersections
- Export types from a central location

## Testing Best Practices

### Component Testing
- Use Vitest for unit tests
- Test components in isolation
- Mock external dependencies
- Test user interactions

### Integration Testing
- Use Playwright for E2E tests
- Test critical user paths
- Maintain test isolation
- Use proper test data

## Performance Considerations

### Loading Performance
- Implement proper code splitting
- Use lazy loading for images and components
- Optimize font loading
- Minimize JavaScript bundle size

### Runtime Performance
- Avoid unnecessary re-renders
- Use proper memoization
- Implement virtual scrolling for long lists
- Monitor performance metrics

## Deployment

### Build Process
- Use proper environment variables
- Implement staging environments
- Use continuous integration
- Implement proper caching strategies

### Monitoring
- Set up error tracking
- Monitor performance metrics
- Track user analytics
- Implement logging

## Git Workflow

### Commit Messages
- Use conventional commits
- Write descriptive messages
- Reference issues/tickets
- Keep commits focused

### Branch Strategy
- Use feature branches
- Implement proper PR reviews
- Maintain clean git history
- Use proper branch naming

## Documentation

### Code Documentation
- Document complex logic
- Use JSDoc for important functions
- Maintain README files
- Document configuration changes

### Component Documentation
- Document props and usage
- Provide examples
- Document side effects
- Maintain changelog

---

Remember to:
- Keep components small and focused
- Follow TypeScript best practices
- Maintain consistent code style
- Write tests for critical functionality
- Document important decisions
- Monitor performance
- Review code regularly