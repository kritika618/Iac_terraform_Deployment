name: Terraform lambda-dev

on:
  push:  
    branches:
      - main
    paths:
      - 'infrastructure/lambda/'

jobs:
  terraform:      
    name: 'Terraform Init, Format, Validate, Plan, Apply'    
    runs-on: ubuntu-latest 

    env:
      AWS_REGION: 'ap-south-1'    
      TF_VERSION: '1.4.0'

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v2
        with:
          terraform_version: ${{ env.TF_VERSION }}

      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-session-token: ${{ secrets.AWS_SESSION_TOKEN }}
          aws-region: ${{ env.AWS_REGION }}

      - name: Terraform Init
        run: |
          export TF_LOG=DEBUG
          terraform -chdir=infrastructure/lambda init 

      - name: Terraform fmt
        run: terraform fmt
        working-directory: infrastructure/lambda 

      - name: Terraform plan
        run: terraform plan -out=tfplan 
        working-directory: infrastructure/lambda

      - name: Show Terraform Plan with Debugging
        run: |
          export TF_LOG=DEBUG
          terraform show tfplan
        working-directory: infrastructure/lambda

      - name: Terraform Apply
        if: github.ref == 'refs/heads/main'
        run: terraform -chdir=infrastructure/lambda apply -auto-approve 
