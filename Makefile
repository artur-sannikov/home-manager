.PHONY: update
update:
	home-manager switch --flake .#asus-dx

.PHONY: clean
clean:
	nix-collect-garbage -d
