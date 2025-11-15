# ┌───┐ ┌───┐ ┌───┐ ┌───┐ ┌───┐
# │ H │ │ E │ │ T │ │ F │ │ S │
# └───┘ └───┘ └───┘ └───┘ └───┘
# ===========================================================
# 🌍 HETFS LTD. DevTools Fish Abbreviations + Completions
# https://github.com/hetfs/archdotfiles
# ===========================================================

# ===========================================================
# -------------------------- Abbreviations -----------------
# ===========================================================

# -------------------------- Git ---------------------------
abbr g git
abbr gi git init
abbr gc git clone
abbr ga git add .
abbr gap git add -p
abbr gb git branch
abbr gba git branch -a
abbr gbd git branch -d
abbr gbD git branch -D
abbr gco git checkout
abbr gcob git checkout -b
abbr gcm git commit -m
abbr gcs git commit -S -m
abbr gca git commit --amend --no-edit
abbr gcan git commit --amend -n
abbr gundo git reset --soft HEAD~1
abbr gfix 'git commit --amend --no-edit && git push -f'
abbr gd git diff
abbr gds 'git diff --staged'
abbr gdt git difftool
abbr gdc git difftool --cached
abbr gf git fetch
abbr gfa 'git fetch --all --prune'
abbr gl git pull
abbr glr 'git pull --rebase'
abbr gm git merge
abbr gmf 'git merge --ff-only'
abbr gp git push
abbr gpf 'git push -f'
abbr gpo 'git push origin'
abbr gpt 'git push --tags'
abbr gpr 'gh pr create'
abbr gprv 'gh pr view -w'
abbr gprc 'gh pr checkout'
abbr gr 'git rebase -i'
abbr gra 'git rebase --abort'
abbr grc 'git rebase --continue'
abbr grs 'git rebase --skip'
abbr gs 'git status -sb'
abbr gsa 'git stash apply'
abbr gsp 'git stash pop'
abbr gst git stash
abbr gsl 'git stash list'
abbr gt git tag
abbr gta 'git tag -a'
abbr gtd 'git tag -d'
abbr gu 'git reset @ --hard'
abbr gclean 'git clean -xdf'
abbr gg 'git log --oneline --graph --decorate'
abbr ggg 'git log --oneline --graph --decorate --show-signature'
abbr gls 'git log --stat --oneline'
abbr gprev 'git show HEAD~1'
abbr gsha 'git rev-parse HEAD'
abbr gshort 'git rev-parse --short HEAD'
abbr gmain 'git checkout main'
abbr gdev 'git checkout develop'
abbr gsync 'git fetch origin main && git rebase origin/main'
abbr gprune 'git remote prune origin'
abbr gcleanb 'git branch --merged | grep -v "main" | xargs git branch -d'

# -------------------------- Docker / Compose ----------------
abbr d docker
abbr dc docker-compose
abbr dcb docker-compose build
abbr dcd docker-compose down
abbr dcu docker-compose up -d
abbr dcr docker-compose run
abbr dcl docker-compose logs
abbr dps docker ps
abbr dpsa 'docker ps -a'
abbr di docker images
abbr dnet docker network ls
abbr dclean 'docker system prune -af'
abbr dcdu 'docker-compose down && docker-compose build && docker-compose up -d'

# -------------------------- Kubernetes ----------------------
abbr k kubectl
abbr kctx kubectx
abbr kns kubens
abbr kgp 'kubectl get pods'
abbr kgd 'kubectl get deployments'
abbr kgs 'kubectl get svc'
abbr kl 'kubectl logs -f'
abbr ke 'kubectl exec -it'
abbr kd 'kubectl describe'
abbr kr 'kubectl rollout restart'

# ------------------ Python -----------------
abbr vn 'python -m venv .venv'
abbr psa 'source .venv/bin/activte.fish'
abbr pd deactivate

# --------------poetry -------------
abbr p poetry
abbr pa poetry add
abbr pad 'poetry add --group dev'
abbr pr poetry run
abbr pi poetry install
abbr psh poetry shell
abbr pu poetry update
abbr pb poetry build
abbr pp poetry publish

# -------------------------- Editors & System ----------------
abbr vi nvim
abbr vim nvim
abbr v nvim
abbr neogit 'nvim +Neogit'
abbr vimc 'nvim ~/.config/nvim/init.lua'
abbr nvrc 'nvim ~/.config/nvim'

abbr cls clear
abbr c clear
abbr ll 'eza -l --git'
abbr la 'eza -la --git'
abbr lt 'eza -T --git-ignore --icons'
abbr l 'eza --icons'
abbr reload 'source ~/.config/fish/config.fish'
abbr path 'echo $PATH | tr " " "\n"'
abbr src 'source ~/.config/fish/config.fish'

# ===========================================================
# -------------------------- Completions --------------------
# ===========================================================
complete -c git -f
complete -c docker -f
complete -c docker-compose -f
complete -c kubectl -f
complete -c poetry -f
complete -c python -f
