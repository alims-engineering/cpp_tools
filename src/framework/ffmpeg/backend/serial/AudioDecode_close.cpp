#include <cpptools/framework/ffmpeg/backend/serial/AudioDecode_close.h>


#include <iostream>

extern "C" {
#include <libavformat/avformat.h>
#include <libavcodec/avcodec.h>
#include <libswresample/swresample.h>
#include <libavutil/avutil.h>
#include <libavutil/opt.h>
#include <libavutil/channel_layout.h>
#include <libavutil/samplefmt.h>
}



namespace cpptools::framework::ffmpeg::backend::serial {


	void AudioDecode_close(
		AVFormatContext*& fmtCtx,
		AVCodecContext*& codecCtx,
		SwrContext*& swrCtx,
		AVPacket*& pkt,
		AVFrame*& frame
	) {
		if (pkt)   av_packet_free(&pkt);
		if (frame) av_frame_free(&frame);

		if (swrCtx)   swr_free(&swrCtx);
		if (codecCtx) avcodec_free_context(&codecCtx);

		if (fmtCtx) avformat_close_input(&fmtCtx);
	}



}