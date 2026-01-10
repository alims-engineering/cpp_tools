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



	bool AudioDecode_open(
		const char* path,
		int* streamIndex,
		AVFormatContext*& fmtCtx,
		AVStream*& audioStream,
		const AVCodec*& codec,
		AVCodecContext*& codecCtx,
		SwrContext*& swrCtx,
		AVPacket*& pkt,
		AVFrame*& frame,
		int outSampleRate = 44100,
		AVSampleFormat out_sample_fmt = AV_SAMPLE_FMT_S16,
		int out_channels = 2
	);


}