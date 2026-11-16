#!/usr/bin/env bash
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

cd -- "$(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")/../../.."

exec tools/bazel run --cpu=arm64 --config=stamp \
    --jobs="${JOBS:-8}" --make_jobs="${JOBS:-8}" \
    "$@" //kernel_device_modules-6.6:kernel_dist -- \
    --destdir="${DIST_DIR:-out/dist}"
