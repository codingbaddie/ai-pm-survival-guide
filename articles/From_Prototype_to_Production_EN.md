# 🛑 From Prototype to Production: Why Does AI Code Take Engineers 2 Weeks to Fix?

## The Prototype Illusion (AI 視角的盲點)

As PMs, we love AI Prototypes. We ask Claude to "Make a Dashboard," and 30 seconds later, we have a working HTML/React file. It looks done.
But when we hand this to an engineer, they sigh and say: *"I need 2 weeks to implement this."*

Why? Are they lazy?
No. They are paying off the **"Integration Debt"** that the AI ignored.

## What is "Integration Debt"?

### 1. The Data Orphan (孤兒資料)
*   **AI Prototype**: Uses `const data = [{ name: 'Alice', score: 99 }]`. Hardcoded, fake data.
*   **Production**: Needs to fetch data from a real database, handle authentication tokens (`Bearer ...`), manage loading states (`isLoading`), and handle network errors (`404/500`).
*   **The Gap**: 80% of the work is connecting the UI to the real data pipe.

### 2. The Design System Clash (家規衝突)
*   **AI Prototype**: Writes raw CSS or uses inline styles. It creates its own buttons.
*   **Production**: The company has a **Design System** (e.g., MUI, AntD). The engineer has to rewrite every button to match the company's global theme and responsive rules.
*   **The Gap**: Refactoring "Cowboy Code" to "Enterprise Standard."

### 3. The Happy Path Bias (倖存者偏差)
*   **AI Prototype**: Assumes the user always clicks the right button.
*   **Production**: What if the user inputs an emoji? What if the internet disconnects? What if the permission is denied?
*   **The Gap**: Error handling and edge cases account for 50% of production code volume.

## PM's Guide to "Talk Engineering"

Next time you hand off AI code, say this to gain instant respect:

> "Here is the AI prototype for **visual reference**.
> I know the **State Management** and **API Hooks** are mocked.
> Please treat this as a **high-fidelity wireframe**, not production code."

This shows you understand the difference between a **Toy** and a **Product**.
