version 1.0

task tb_report {
  input {
    File results 
  }

  command {
    # download report script
    git clone https://github.com/DOH-JDJ0303/tb_report.git && mv tb_report/tb_report.qmd ./

    # run Quarto
    quarto render tb_report.qmd -P file:${results}
  } 

  output {
    File report = "tb_report.pdf"
  }

  runtime {
    docker: "jdj0303/tb-report:1.0.1"
    memory: "4 GB"
    cpus: 2
    disks: "local-disk 100 SSD"
    preemptible: 0
  }
}
