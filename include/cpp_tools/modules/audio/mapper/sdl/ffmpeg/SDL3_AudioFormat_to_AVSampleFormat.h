#pragma once


#include <SDL3/SDL.h>


extern "C" {
#include <libavformat/avformat.h>
#include <libavcodec/avcodec.h>
#include <libswresample/swresample.h>
#include <libavutil/avutil.h>
#include <libavutil/opt.h>
#include <libavutil/channel_layout.h>
#include <libavutil/samplefmt.h>
}


namespace cpptools::modules::audio::mapper::sdl::ffmpeg {

	constexpr AVSampleFormat 
		SDL3_AudioFormat_to_AVSampleFormat(SDL_AudioFormat fmt) noexcept
	{
		switch (fmt) {
		case SDL_AUDIO_U8: return AV_SAMPLE_FMT_U8;
		case SDL_AUDIO_S8: return AV_SAMPLE_FMT_S16; // v8.0 without AV_SAMPLE_FMT_S8;
		case SDL_AUDIO_S16: return AV_SAMPLE_FMT_S16;
		case SDL_AUDIO_S32: return AV_SAMPLE_FMT_S32;
		case SDL_AUDIO_F32: return AV_SAMPLE_FMT_FLT;
		default: { return AV_SAMPLE_FMT_NONE; }

		}
	}


}