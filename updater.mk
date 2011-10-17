# Copyright (C) 2011, SuperTeam Development Group.
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

ST_SYSTEM_FS := yaffs2
ST_SYSTEM_BLOCK := MTD
ST_SYSTEM_DEV := system
ST_SYSTEM_NAME := /system

ST_DATA_FS := yaffs2
ST_DATA_BLOCK := MTD
ST_DATA_DEV := userdata
ST_DATA_NAME := /data

ST_BOOT_METHOD := raw
ST_BOOT_FS := yaffs2
ST_BOOT_BLOCK := MTD
ST_BOOT_DEV := /boot
ST_BOOT_NAME := /boot