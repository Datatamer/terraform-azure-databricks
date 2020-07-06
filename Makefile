ifneq (,)
.error This Makefile requires GNU Make.
endif

GIT_PREFIX = git@github.com

MAKEFILE_DIR = ops-makefile
MAKEFILE_TAG = master
MAKEFILE_REPO = Datatamer/ops-makefile.git

export BUILD_PATH ?= $(shell 'pwd')

ifneq ($(shell grep $(MAKEFILE_REPO) $(BUILD_PATH)/.git/config),)
  include $(BUILD_PATH)/Makefile.*
  include $(BUILD_PATH)/modules/*/Makefile*
else ifeq (,$(firstword $(wildcard $(MAKEFILE_DIR))))
  $(shell git clone -c advice.detachedHead=false --depth=1 -b $(MAKEFILE_TAG) $(GIT_PREFIX):$(MAKEFILE_REPO))
  include $(BUILD_PATH)/$(MAKEFILE_DIR)/Makefile.*
  include $(BUILD_PATH)/$(MAKEFILE_DIR)/modules/*/Makefile*
else
  UPDATE := $(shell git -C ops-makefile pull)
  include $(BUILD_PATH)/$(MAKEFILE_DIR)/Makefile.*
  include $(BUILD_PATH)/$(MAKEFILE_DIR)/modules/*/Makefile*
endif

EXCLUDE := $(filter-out $(MAKEFILE_DIR)/Makefile, $(wildcard $(MAKEFILE_DIR)/*))

clean:
	rm -rf $(MAKEFILE_DIR)
