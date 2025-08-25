#!/bin/bash
set -e

# Base models directory (adjust if needed)
MODEL_DIR=/workspace/ComfyUI/models

mkdir -p $MODEL_DIR/vae $MODEL_DIR/clip $MODEL_DIR/unet $MODEL_DIR/loras

echo "🔍 Checking models..."

# ---------------- VAEs ----------------
if [ ! -f "$MODEL_DIR/vae/wan_2.1_vae.safetensors" ]; then
    echo "⬇️ Downloading wan_2.1_vae..."
    curl -L -o $MODEL_DIR/vae/wan_2.1_vae.safetensors <MODEL_URL>
fi

# ---------------- CLIP ----------------
if [ ! -f "$MODEL_DIR/clip/umt5_xxl_fp16.safetensors" ]; then
    echo "⬇️ Downloading umt5_xxl_fp16..."
    curl -L -o $MODEL_DIR/clip/umt5_xxl_fp16.safetensors <MODEL_URL>
fi

# ---------------- UNETs ----------------
if [ ! -f "$MODEL_DIR/unet/wan2.2_t2v_high_noise_14B_fp8_scaled.safetensors" ]; then
    echo "⬇️ Downloading wan2.2_t2v_high_noise..."
    curl -L -o $MODEL_DIR/unet/wan2.2_t2v_high_noise_14B_fp8_scaled.safetensors <MODEL_URL>
fi

if [ ! -f "$MODEL_DIR/unet/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors" ]; then
    echo "⬇️ Downloading wan2.2_t2v_low_noise..."
    curl -L -o $MODEL_DIR/unet/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors <MODEL_URL>
fi

# ---------------- LoRAs ----------------
if [ ! -f "$MODEL_DIR/loras/maria_lora_low_noise.safetensors" ]; then
    echo "⬇️ Downloading maria_lora_low_noise..."
    curl -L -o $MODEL_DIR/loras/maria_lora_low_noise.safetensors "https://huggingface.co/mihaiciorobitca/maria_lora_low_noise/resolve/main/maria_lora_low_noise.safetensors?download=true"
fi

if [ ! -f "$MODEL_DIR/loras/Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank32.safetensors" ]; then
    echo "⬇️ Downloading Wan21_T2V_14B_lightx2v_cfg_step_distill..."
    curl -L -o $MODEL_DIR/loras/Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank32.safetensors "https://huggingface.co/mihaiciorobitca/Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank32/resolve/main/Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank32.safetensors?download=true"
fi

if [ ! -f "$MODEL_DIR/loras/foot_lora_v3_high_noise.safetensors" ]; then
    echo "⬇️ Downloading foot_lora_v3_high_noise..."
    curl -L -o $MODEL_DIR/loras/foot_lora_v3_high_noise.safetensors "https://huggingface.co/mihaiciorobitca/foot_lora_v3_high_noise/resolve/main/foot_lora_v3_high_noise.safetensors?download=true"
fi

if [ ! -f "$MODEL_DIR/loras/foot_lora_v3_wan21.safetensors" ]; then
    echo "⬇️ Downloading foot_lora_v3_wan21..."
    curl -L -o $MODEL_DIR/loras/foot_lora_v3_wan21.safetensors "https://huggingface.co/mihaiciorobitca/foot_lora_v3_wan21/resolve/main/foot_lora_v3_wan21.safetensors?download=true"
fi

if [ ! -f "$MODEL_DIR/loras/maria_lora_high_noise.safetensors" ]; then
    echo "⬇️ Downloading maria_lora_high_noise..."
    curl -L -o $MODEL_DIR/loras/maria_lora_high_noise.safetensors "https://huggingface.co/mihaiciorobitca/maria_lora_high_noise/resolve/main/maria_lora_high_noise.safetensors?download=true"
fi

echo "✅ All models ready."

# Start ComfyUI worker (replace with actual worker entrypoint if different)
exec python3 main.py
