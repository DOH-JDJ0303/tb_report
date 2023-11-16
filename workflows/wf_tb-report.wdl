version 1.0

import "../tasks/task_tb-report.wdl" as tb_report_tk

workflow tb_report_wf {
  input {
    File result
  }

  call tb_report_tk.tb_report as tb_report {
    input:
      results=result
  }

  output {
    File report = tb_report.report
  }
}
