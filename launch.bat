@echo off
call conda activate comfyenv

REM Check if torch is installed with correct version
pip show torch | findstr "2.5.1+cu121" >nul
if errorlevel 1 (
    echo Reinstalling PyTorch packages...
    pip uninstall torch torchvision torchaudio -y
    pip install --no-deps torch==2.5.1+cu121 torchvision==0.20.1+cu121 torchaudio==2.5.1+cu121 --extra-index-url https://download.pytorch.org/whl/cu121
)

REM Install other requirements without reinstalling PyTorch
pip install --no-deps -r requirements.txt

if "%1"=="test" (
    echo Testing custom node loading...
    python main.py --output-directory "F:/source/Models" --input-directory "F:/source/Models" --verbose
) else (
    python main.py --output-directory "F:/source/Models" --input-directory "F:/source/Models"
)
