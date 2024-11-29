@echo off
call conda activate comfyenv
pip install -r requirements.txt
python main.py --output-directory "F:/source/Models" --input-directory "F:/source/Models"
