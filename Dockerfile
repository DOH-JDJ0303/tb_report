# Use a base image with Ubuntu
FROM bioconductor/bioconductor_docker

# required R packages
RUN R -e "install.packages(c('tidyverse', 'knitr','kableExtra'), repos='https://cran.rstudio.com/')"

# Install Quarto
RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.450/quarto-1.3.450-linux-amd64.deb && sudo dpkg -i quarto-1.3.450-linux-amd64.deb

# Install TinyTex
RUN quarto install tinytex

# Download report script
RUN git clone https://github.com/DOH-JDJ0303/tb_report.git && mv tb_report/tb_report.qmd ./
