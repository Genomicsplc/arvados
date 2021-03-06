# Copyright (C) The Arvados Authors. All rights reserved.
#
# SPDX-License-Identifier: Apache-2.0

cwlVersion: v1.0
class: CommandLineTool
requirements:
  - class: InlineJavascriptRequirement
  - class: ShellCommandRequirement
arguments:
  - cd
  - $(inputs.hello.dirname)
  - {shellQuote: false, valueFrom: "&&"}
  - ls
stdout: hello.out
inputs:
  hello:
    type: File
    default:
      class: File
      location: keep:4d8a70b1e63b2aad6984e40e338e2373+69/hello.txt
    secondaryFiles:
      - .idx
outputs:
  out:
    type: File
    outputBinding:
      glob: hello.out
