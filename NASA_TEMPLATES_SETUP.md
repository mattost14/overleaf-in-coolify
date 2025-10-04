# Adding NASA LaTeX Templates to Overleaf

This guide explains how to add NASA LaTeX document templates from https://github.com/nasa/nasa-latex-docs to your Overleaf instance.

## Method 1: Create Template Projects (Recommended)

### Step 1: Create a Templates User

1. Register a dedicated user account in Overleaf (e.g., `templates@overleaf.cei.ita.br`)
2. Login to this account
3. Get the user ID:
   - In Coolify, run in the Overleaf container:
   ```bash
   docker exec <overleaf-container> node -e "const mongoose = require('mongoose'); mongoose.connect('mongodb://mongo/sharelatex'); const User = require('/overleaf/services/web/app/src/models/User').User; User.findOne({email: 'templates@overleaf.cei.ita.br'}, (err, user) => { console.log(user._id); process.exit(); });"
   ```

### Step 2: Upload NASA Templates

For each NASA template you want to add:

1. Clone the NASA repo locally:
   ```bash
   git clone https://github.com/nasa/nasa-latex-docs.git
   cd nasa-latex-docs
   ```

2. Templates available:
   - `support/templates/NASA-TM-Template/` - Technical Memorandum
   - `support/templates/NASA-TP-Template/` - Technical Publication
   - `support/templates/NASA-CR-Template/` - Contractor Report
   - `support/templates/NASA-CP-Template/` - Conference Publication

3. **Login as the templates user** and create a new project for each template:
   - Upload all files from each template directory
   - Name the project clearly (e.g., "NASA Technical Memorandum Template")

### Step 3: Configure Overleaf

In **Coolify Environment Variables**, add:

```bash
# The user ID of your templates account
OVERLEAF_TEMPLATES_USER_ID=<user-id-from-step-1>
```

All projects created by this user will appear as templates for all users.

---

## Method 2: Add External Template Links

Add links to external template pages or create custom project creation shortcuts.

In **Coolify Environment Variables**, set:

```bash
OVERLEAF_NEW_PROJECT_TEMPLATE_LINKS=[{"name":"NASA LaTeX Templates","url":"https://github.com/nasa/nasa-latex-docs"}]
```

This adds a link in the "New Project" menu that directs users to the NASA GitHub repository.

---

## Method 3: Pre-populate Templates on Server (Advanced)

### Create a templates directory on the server:

1. In your deployment, create:
   ```bash
   mkdir -p ./templates/nasa
   cd ./templates/nasa
   ```

2. Clone NASA templates:
   ```bash
   git clone https://github.com/nasa/nasa-latex-docs.git
   ```

3. Mount this directory in `docker-compose.yml`:
   ```yaml
   volumes:
     - ./data/sharelatex:/var/lib/overleaf
     - ./templates:/templates:ro  # Read-only mount
   ```

4. Create a script to import templates into MongoDB (requires custom development)

---

## Recommended Approach

**Use Method 1** for the best user experience:
- Templates are native Overleaf projects
- Users can preview before using
- Easy to customize for your organization
- No external dependencies

### Quick Start Checklist

- [ ] Create templates user account
- [ ] Get user ID from database
- [ ] Upload NASA template projects as that user
- [ ] Set `OVERLEAF_TEMPLATES_USER_ID` in Coolify
- [ ] Restart Overleaf
- [ ] Verify templates appear in "New Project" dropdown

---

## NASA Template Types

The nasa-latex-docs repository includes:

1. **NASA-TM-Template** - Technical Memorandum
   - For internal technical reports
   - Single-column format

2. **NASA-TP-Template** - Technical Publication  
   - For formal technical publications
   - Double-column format

3. **NASA-CR-Template** - Contractor Report
   - For contractor-submitted documents

4. **NASA-CP-Template** - Conference Publication
   - For conference papers and proceedings

Each includes:
- LaTeX class files
- Example documents
- NASA branding elements
- Bibliography styles
