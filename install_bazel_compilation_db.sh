INSTALL_DIR="/usr/local/bin"
VERSION="0.4.5"

# Check if script executed with sudo
[ $(whoami) = root ] || {
    echo -e "$ERROR_MARK Failed to run script as sudo!"
    exit
}

# Download and symlink.
(
    cd "${INSTALL_DIR}" &&
        curl -L "https://github.com/grailbio/bazel-compilation-database/archive/${VERSION}.tar.gz" | tar -xz &&
        ln -f -s "${INSTALL_DIR}/bazel-compilation-database-${VERSION}/generate.sh" bazel-compdb
)

echo "You can now run: bazel-compdb from within a Bazel workspace.\n \
    This will generate compile_commands.json in your root folder"
