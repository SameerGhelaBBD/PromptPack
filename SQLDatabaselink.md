Welcome to the Prompt Pack Repo

To use our purpose built tool: 

1. You can access the hosted chatbot on the following link: https://promp-pack.app.n8n.cloud/webhook/4e91ce55-6c33-454c-adf3-984ff0393933/chat

Prompt examples: 
Give me the number of employees in the Design Department?

Give me Jordan Jones employee profile?

What is the best performing department?

Who is the best performing employee in the Product Department?

Is Jordan William a good employee for a new AI team?

To customize your own AI Agent based on our template or access the source code for our agent Kevin please see the file named Prompt Pack Final Model JSON file.

To run our model on the n8n development environment:

1. Open the JSON file on n8n using upload via file.
2. Connect the AI model of your choice using the API keys
3. Ensure the database is linked to the repository of your choice.
PLEASE NOT THAT YOU CAN ONLY PROMPT THE MODEL BASED ON THE DATA IN YOUR DATABASE/ KNOWLEDGE BASE. HOWEVER THIS CAN BE IMPROVED UPON IN FUTURE DEVELOPEMNTS.
4. You will be able to test connections as you make them, as well as test chat functionality and results within the development environment.
5. The live bot Kevin is based on the following use case: "An Agentic AI Chat bot that is configurable and customizable to suite the needs of BBD employees, teams and departments. The Agentic AI is built on the n8n platform, connected to a simple SQL database hosted on Azure. Within the n8n platform we created a workflow that simplifies AI development for anyone with any skillset using plug and play frameworks. We connected Anthropics AI models to a pre-built n8n AI Agent that is linked to a simple memory store connected to our hosted database on Azure. The use case for this specific model is to provide executives at BBD the capabilities to choose employees for new projects based on available company data ranging from training and education, work behaviour, employee HR data, reviews, etc. The agent will provide suitable profiles using these metrics to determine if the employee will be a great fit for the new team."
6. See below the methods to access Kevin's knowledge base. 

Sever name on Azure: companyanalytics.database.windows.net

Connection strings:

Server=tcp:companyanalytics.database.windows.net,1433;Initial Catalog=CompanyAnalytics;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;Authentication="Active Directory Default";

Server=tcp:companyanalytics.database.windows.net,1433;Initial Catalog=CompanyAnalytics;Persist Security Info=False;User ID=sqladmin;Password={your_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;
