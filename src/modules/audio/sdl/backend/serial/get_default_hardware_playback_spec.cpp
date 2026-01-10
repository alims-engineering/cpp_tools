#include <cpptools/modules/audio/sdl/backend/serial/get_default_playback_hardware_spec.h>

#include <cstdio>
#include <iostream>
#include <SDL3/SDL.h>

namespace cpptools::modules::audio::sdl::backend::serial {


	SDL_AudioSpec get_default_playback_hardware_spec() {
		// SDL3 中，SDL_AudioSpec 结构体非常精简，仅包含 format, channels, freq
		SDL_AudioSpec spec;
		SDL_zero(spec);

		// SDL3 suggest SDL_GetAudioDeviceFormat 直接查询设备信息
		// SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK 指代默认的音频输出设备
		// 3rd 参数是 sample_frames（缓冲区长度），如果不需要可以传 nullptr
		if (SDL_GetAudioDeviceFormat(SDL_AUDIO_DEVICE_DEFAULT_PLAYBACK, &spec, nullptr)) {
			return spec;
		}
		else {
			// if 查询失败（可能是 SDL 未初始化或无音频设备）
			std::cerr << "SDL3 Query Failed: " << SDL_GetError() << std::endl;

			// 返回一个稳妥的默认值
			SDL_AudioSpec fallback{};
			fallback.format = SDL_AUDIO_S16; // 16位有符号整数
			fallback.channels = 2;           // 双声道
			fallback.freq = 44100;           // 44.1kHz
			return fallback;
		}
	}



}