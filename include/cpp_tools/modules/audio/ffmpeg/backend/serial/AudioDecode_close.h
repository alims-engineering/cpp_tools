#pragma once


extern "C" {
#include <libavformat/avformat.h>
#include <libavcodec/avcodec.h>
#include <libswresample/swresample.h>
#include <libavutil/avutil.h>
#include <libavutil/opt.h>
#include <libavutil/channel_layout.h>
#include <libavutil/samplefmt.h>
}

namespace cpptools::modules::audio::ffmpeg::backend::serial {


	void AudioDecode_close(
		AVFormatContext*& fmtCtx,
		AVCodecContext*& codecCtx,
		SwrContext*& swrCtx,
		AVPacket*& pkt,
		AVFrame*& frame
	);

}