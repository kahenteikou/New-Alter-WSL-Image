#! /usr/bin/env bash

# この時点で打つべきタグを決定して$TAGに代入しておく
# タグの情報源はgitのコミットログやプロジェクト内の設定ファイルなどが考えられる

TAG=${PKG_VERSION}-${PKG_RELEASE}
if [[ -n "$(git tag -l ${TAG})" ]]; then
    echo "Already exist tag: ${TAG}"
    echo "Do nothing."
else
    git config --global "url.git@github.com:.pushinsteadof" "https://github.com/"
    git config --global user.name "Travis CI"
    git config --global user.email "travis@example.com"
    mkdir -p $HOME/.ssh
    chmod 700 $HOME/.ssh
    openssl aes-256-cbc -K $encrypted_****_key -iv $encrypted_****_iv -in id_ecdsa.enc -out $HOME/.ssh/id_ecdsa -d
    chmod 600 $HOME/.ssh/id_ecdsa
    echo git tag $TAG
    git tag ${TAG}
    echo git push origin $TAG
    git push origin ${TAG}
fi

