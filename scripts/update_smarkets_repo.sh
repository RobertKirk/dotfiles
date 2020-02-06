#!/usr/bin/env bash

# Change to your local smarkets repo
SMARKETS_DIR="/home/robert/smarkets"

# generate tags
function get_tags() {
    echo "Generating Tags"
    pushd "${SMARKETS_DIR}"
    rm tags tags.temp tags.lock &> /dev/null
    rg --files | ctags -R --links=no --options="$HOME/.ctags" -L - 
    popd
    echo "Tags Generated"
}

function update_worktree_tags() {
    worktree_dir=$1
    echo "Copying Tags"
    pushd "${worktree_dir}"
    for repo in $(ls -d */ | xargs); do
        echo "Copying Tags to $repo"
        cp "$SMARKETS_DIR/tags" "$repo/"
    done;
    popd
    echo "Tags Copied"
}

get_tags
update_worktree_tags "$HOME/git-worktrees/smarkets"
