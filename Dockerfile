FROM runpod/worker-comfyui:5.4.0-base

# install custom nodes using comfy-cli
RUN comfy-node-install ComfyUI-Wan-ComfyNodes
RUN comfy-node-install ComfyUI-Impact-Pack

# download models
# VAE → put into ComfyUI/models/vae/
RUN curl -L -o ComfyUI/models/vae/wan_2.1_vae.safetensors https://huggingface.co/mihaiciorobitca/wan_2.1_vae/resolve/main/wan_2.1_vae.safetensors?download=true

# CLIP → put into ComfyUI/models/clip/
RUN curl -L -o ComfyUI/models/clip/umt5_xxl_fp16.safetensors https://huggingface.co/mihaiciorobitca/umt5_xxl_fp16/resolve/main/umt5_xxl_fp16.safetensors?download=true

# UNETs → put into ComfyUI/models/unet/
RUN curl -L -o ComfyUI/models/unet/wan2.2_t2v_high_noise_14B_fp8_scaled.safetensors https://huggingface.co/mihaiciorobitca/wan2.2_t2v_high_noise_14B_fp8_scaled/resolve/main/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors?download=true
RUN curl -L -o ComfyUI/models/unet/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors https://huggingface.co/mihaiciorobitca/wan2.2_t2v_low_noise_14B_fp8_scaled/resolve/main/wan2.2_t2v_low_noise_14B_fp8_scaled.safetensors?download=true

# LoRAs → put into ComfyUI/models/loras/
RUN curl -L -o ComfyUI/models/loras/maria_lora_low_noise.safetensors https://huggingface.co/mihaiciorobitca/maria_lora_low_noise/resolve/main/maria_lora_low_noise.safetensors?download=true
RUN curl -L -o ComfyUI/models/loras/Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank32.safetensors https://huggingface.co/mihaiciorobitca/Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank32/resolve/main/Wan21_T2V_14B_lightx2v_cfg_step_distill_lora_rank32.safetensors?download=true
RUN curl -L -o ComfyUI/models/loras/foot_lora_v3_high_noise.safetensors https://huggingface.co/mihaiciorobitca/foot_lora_v3_high_noise/resolve/main/foot_lora_v3_high_noise.safetensors?download=true
RUN curl -L -o ComfyUI/models/loras/foot_lora_v3_wan21.safetensors https://huggingface.co/mihaiciorobitca/foot_lora_v3_wan21/resolve/main/foot_lora_v3_wan21.safetensors?download=true
RUN curl -L -o ComfyUI/models/loras/maria_lora_high_noise.safetensors https://huggingface.co/mihaiciorobitca/maria_lora_high_noise/resolve/main/maria_lora_high_noise.safetensors?download=true

