#!/usr/bin/env bash
set -o errexit -o errtrace -o functrace -o nounset -o pipefail

export TITLE="Homekit Alsa Speaker"
export DESCRIPTION="Control your alsa devices volume with HomeKit"
export IMAGE_NAME="homekit-alsa"

# shellcheck source=vars.sh
. "$(cd "$(dirname "${BASH_SOURCE[0]:-$PWD}")" 2>/dev/null 1>&2 && pwd)/helpers.sh"
