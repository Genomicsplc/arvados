# Copyright (C) The Arvados Authors. All rights reserved.
#
# SPDX-License-Identifier: Apache-2.0

cwlVersion: v1.0
class: CommandLineTool
inputs:
  inp2:
    type: Directory
    default:
      class: Directory
      listing:
        - class: File
          location: "inp1/hello.txt"
outputs: []
arguments: [echo, $(inputs.inp2)]