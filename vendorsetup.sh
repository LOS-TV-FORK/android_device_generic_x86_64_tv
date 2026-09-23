#
# Copyright 2024 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Get the directory of this vendorsetup.sh script
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

# Intel Houdini (obsolete native bridge, conflicts with ndk_translation).
# Keep ndk_translation as the only ARM-on-x86 bridge (BoardConfig default).
#export ANDROID_USE_INTEL_HOUDINI=true
if [ "$SKIP_AG_DOWNLOADS" != "true" ]; then
bash bootable/aaropa/download.sh
bash ${CURRENT_DIR}/download_sof-firmware.sh
bash ${CURRENT_DIR}/download_ids.sh
bash ${CURRENT_DIR}/download_toolchain.sh
bash ${CURRENT_DIR}/download_wireless-regdb.sh
fi

