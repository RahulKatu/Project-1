NOTES: 
**************************************************************  PROJECT DEPENDENCY AND OTHER LIBRARY INSTALL**********************
1-MAIN PROJECT CONTAINS ALL THE LIBRARY DLL
2-APPLICATION CONTAINS DOMAIN
3-INFRASTRUCTURE CONTAINS DOMAIN AND APLICATION
INSTALL THE PACKAGES
1-INSTALL THE BELOW PACKAGES IN THE INFRASTRUCTURE
 <ItemGroup>
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="9.0.10" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Design" Version="9.0.10">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
    <PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="9.0.10" />
    <PackageReference Include="Microsoft.Extensions.Hosting.Abstractions" Version="9.0.10" />
  </ItemGroup>

  2-IN THE DOMAIN
   <ItemGroup>
    <PackageReference Include="Microsoft.EntityFrameworkCore" Version="9.0.10" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Design" Version="9.0.10">
      <PrivateAssets>all</PrivateAssets>
      <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
    </PackageReference>
    <PackageReference Include="Microsoft.EntityFrameworkCore.SqlServer" Version="9.0.10" />
    <PackageReference Include="Microsoft.Extensions.Hosting.Abstractions" Version="9.0.10" />
  </ItemGroup>
  ************************************************************************************************************************

  **************************************************************  CHECK THE EF CORE***************************************
  OPEN THE COMMAND PROMPT AND RUN THE BELOW COMMAND
  >dotnet tool list --global | findstr "dotnet-ef" LIKE
  C:\Users\shukl>dotnet tool list --global | findstr "dotnet-ef"
  dotnet-ef       9.0.9        dotnet-ef

 If you already have some version and wanted to upgrade use this cmd
dotnet tool update --global dotnet-ef --version 9.0.0 
or 
dotnet tool update --global dotnet-ef
(this will install latest version)


To install  latest EF use
dotnet tool install --global dotnet-ef
 To unintall
 dotnet tool uninstall --global dotnet-ef

 ************************************************************************************************************************

 TO CHECK EF JUST RUN THE BELW COMMAND IN CMD
 dotnet ef
 FOR EXAMPLE
 C:\Users\shukl>dotnet ef
 Usage: dotnet ef [options] [command]

Options:
  --version        Show version information
  -h|--help        Show help information
  -v|--verbose     Show verbose output.
  --no-color       Don't colorize output.
  --prefix-output  Prefix output with level.

Commands:
  database    Commands to manage the database.
  dbcontext   Commands to manage DbContext types.
  migrations  Commands to manage migrations.

Use "dotnet ef [command] --help" for more information about a command.

  
 Open the domain Project in the Browser and cmd and type the below command
 dotnet ef dbcontext scaffold "Server=RAHUL;Initial Catalog=LEARNING;User Id=sa;Password=Rahul@0822;TrustServerCertificate=True;Encrypt=True" Microsoft.EntityFrameworkCore.SqlServer -o Entities -d
This will generate Entites Folder with class of tables

STEP-2
1-IO removed the LearningContext from the Entites and placed in the Infrastructure Project

****
1-Install Scalar.AspNetCore  in Main Project
2-Install NSwag.AspNetCore  for the swagger
<ItemGroup>
    <PackageReference Include="Microsoft.AspNetCore.OpenApi" Version="9.0.8" />
    <PackageReference Include="NSwag.AspNetCore" Version="14.6.2" />
    <PackageReference Include="Scalar.AspNetCore" Version="2.10.1" />
  </ItemGroup>

  ADDED THE CONNECTION STRING IN appsetting 
   "ConnectionStrings": {

    "DbContext": "Server=RAHUL;Initial Catalog=LEARNING;User Id=sa;Password=Rahul@0822;"
  }

*********************************************************** GIT START*******************************************
Got ot the location
C:\Users\shukl\OneDrive\Desktop\PROJECTS\1-PROJECT-1\ONLIINE EXAM
OPen the cmd and type 
>git init
This will create a git folder.
>git remote add orign https://github.com/RahulKatu/Project-1.git
>git fetch origin
>git checkout -b main

Now Close your Visual Studio and take a new clone in ither folder
git clone https://github.com/RahulKatu/Project-1.git

***************************************************************GIT END