// Copyright (C) The Arvados Authors. All rights reserved.
//
// SPDX-License-Identifier: AGPL-3.0

package main

import (
	"context"
	"os"

	"git.arvados.org/arvados.git/lib/cmd"
	"git.arvados.org/arvados.git/lib/service"
	"git.arvados.org/arvados.git/sdk/go/arvados"
	"git.arvados.org/arvados.git/sdk/go/health"
	"github.com/prometheus/client_golang/prometheus"
)

var (
	version             = "dev"
	command cmd.Handler = service.Command(arvados.ServiceNameHealth, newHandler)
)

func newHandler(ctx context.Context, cluster *arvados.Cluster, _ string, _ *prometheus.Registry) service.Handler {
	return &health.Aggregator{Cluster: cluster}
}

func main() {
	os.Exit(command.RunCommand(os.Args[0], os.Args[1:], os.Stdin, os.Stdout, os.Stderr))
}
