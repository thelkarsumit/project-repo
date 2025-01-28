Putting the `credentials.json` file directly in your Git repository is **not secure**. A better practice is to use **GitHub Secrets** for storing sensitive data like service account keys. GitHub Secrets allow you to securely store and reference sensitive information such as credentials, API tokens, and other private data, which are not exposed in your codebase.

Here’s how you can securely use Google Cloud credentials without storing the `credentials.json` file in your repository:

### Steps for Using GitHub Secrets for GCP Authentication:

#### 1. **Create and Store Your GCP Credentials in GitHub Secrets**
- Go to your **GitHub repository**.
- In the top-right corner, click on the **Settings** tab.
- Under **Secrets and variables**, select **Actions**.
- Click the **New repository secret** button.
- Create a secret with the name `GCP_CREDENTIALS_JSON` and **paste the content** of your service account JSON file there. You can get this JSON by creating a service account in your Google Cloud project and generating a new key.
- Optionally, you can also add the `GCP_PROJECT_ID` as a secret if you want to keep the project ID hidden.

#### 2. **Update Your GitHub Actions Workflow to Use Secrets**
In your GitHub Actions workflow (`terraform-vm-creation.yml`), use the GitHub secrets to authenticate to GCP. Below is the updated workflow that uses secrets for authentication.

### Updated `terraform-vm-creation.yml`:

```yaml
name: Terraform VM Creation

on:
  push:
    branches:
      - main  # Trigger on push to the main branch
    paths:
      - 'terraform/**/*.tf'  # Trigger on changes to .tf files

jobs:
  terraform:
    runs-on: ubuntu-latest
    
    steps:
      # Step 1: Checkout the repository to get the latest code
      - name: Checkout code
        uses: actions/checkout@v2
        
      # Step 2: Set up Terraform
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v1
        with:
          terraform_version: '1.0.11'
        
      # Step 3: Save the Google Cloud credentials JSON from GitHub Secrets
      - name: Set up Google Cloud credentials
        run: echo "${{ secrets.GCP_CREDENTIALS_JSON }}" > "${HOME}/gcloud-key.json"
        
      # Step 4: Authenticate with Google Cloud using the service account JSON
      - name: Authenticate with Google Cloud
        run: |
          gcloud auth activate-service-account --key-file="${HOME}/gcloud-key.json"
          gcloud config set project ${{ secrets.GCP_PROJECT_ID }}  # Set your GCP project ID
      
      # Step 5: Terraform Initialization
      - name: Terraform Init
        run: terraform init
        working-directory: ./terraform  # Specify the Terraform directory if needed
      
      # Step 6: Terraform Plan
      - name: Terraform Plan
        run: terraform plan
        working-directory: ./terraform  # Specify the Terraform directory if needed
        
      # Step 7: Terraform Apply (automatically approve)
      - name: Terraform Apply
        run: terraform apply -auto-approve
        working-directory: ./terraform  # Specify the Terraform directory if needed
```

### Key Points in the Workflow:
1. **GitHub Secrets**: The `GCP_CREDENTIALS_JSON` secret contains the entire content of the service account JSON file. This is securely stored in GitHub and used during the workflow run.
   
2. **Set up Authentication**: The GitHub Actions runner writes the secret into a file (`gcloud-key.json`), and then it uses `gcloud auth activate-service-account` to authenticate to Google Cloud.

3. **Set Project**: The `gcloud config set project` step sets the correct Google Cloud project, and it's also stored as a GitHub secret (`GCP_PROJECT_ID`).

4. **Terraform Commands**: The workflow proceeds with initializing (`terraform init`), planning (`terraform plan`), and applying (`terraform apply`) the Terraform changes.

### 3. **Keep Secrets Secure**:
- Never expose the `GCP_CREDENTIALS_JSON` file in the codebase or logs.
- If you’re working in a team, ensure that only trusted team members have access to the repository secrets.

### 4. **Additional Recommendations for Security**:
- **Use a Service Account with the Minimum Required Permissions**: For the best security practice, make sure the service account has **only the permissions needed** to perform the tasks required by Terraform (e.g., `Compute Admin`, `Viewer`).
- **Rotate Credentials Regularly**: Regularly rotate the service account credentials and update the GitHub secret accordingly.
  
---
