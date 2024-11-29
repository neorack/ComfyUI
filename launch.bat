@echo off
call conda activate comfyenv
pip uninstall torch torchvision torchaudio -y
pip install -r requirements.txt

if "%1"=="test" (
    echo Testing custom node loading...
    python main.py --output-directory "F:/source/Models" --input-directory "F:/source/Models" --verbose
) else (
    python main.py --output-directory "F:/source/Models" --input-directory "F:/source/Models"
)
