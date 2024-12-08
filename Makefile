SRC_DIR = src
BUILD_DIR = build

FILES = $(wildcard $(SRC_DIR)/*.sh)

all: install

$(BUILD_DIR)/%: $(SRC_DIR)/%.sh
	mkdir -p $(BUILD_DIR)
	ln -f $< $(BUILD_DIR)/$(notdir $<)
	cd $(BUILD_DIR) && shc -vrf $(notdir $<) -o $(notdir $(basename $<))
	rm $(BUILD_DIR)/$(notdir $<)

install: $(foreach file,$(FILES),$(BUILD_DIR)/$(notdir $(basename $(file))))

clean:
	rm -rf $(BUILD_DIR)