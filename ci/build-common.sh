common_args="--werror \
-Dlibmpv=true \
-Dtests=true \
"

export CFLAGS="$CFLAGS -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3"

build_subrandr() {
    git clone --depth=1 https://github.com/afishhh/subrandr.git
    if [[ -n ${SUBRANDR_REF:-} ]]; then
        git -C subrandr fetch --depth=1 origin "$SUBRANDR_REF"
        git -C subrandr checkout --detach FETCH_HEAD
    fi
    pushd subrandr
    cargo xtask install --prefix "$@"
    popd
}
