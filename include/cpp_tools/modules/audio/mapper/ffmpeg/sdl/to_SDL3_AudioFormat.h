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


namespace cpptools::modules::audio::mapper::ffmpeg::sdl{


    constexpr SDL_AudioFormat
        to_SDL3_AudioFormat(AVSampleFormat fmt) noexcept
    {
        switch (fmt) {
        case AV_SAMPLE_FMT_U8:  return SDL_AUDIO_U8;
        case AV_SAMPLE_FMT_S16: return SDL_AUDIO_S16;
        case AV_SAMPLE_FMT_S32: return SDL_AUDIO_S32;
        case AV_SAMPLE_FMT_FLT: return SDL_AUDIO_F32;
        default:                return SDL_AUDIO_UNKNOWN;
        }
    }
}