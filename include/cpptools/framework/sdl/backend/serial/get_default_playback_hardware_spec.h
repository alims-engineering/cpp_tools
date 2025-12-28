#pragma once


#include <SDL3/SDL.h>


namespace cpptools::framework::sdl::backend::serial {

	SDL_AudioSpec get_default_playback_hardware_spec();



}