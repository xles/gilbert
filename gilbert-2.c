#include <stdio.h>
#include <SDL2/SDL.h>
#include <squirrel.h>

const int SCREEN_WIDTH = 1280;
const int SCREEN_HEIGHT = 800;

int main(int argc, char **argv)
{
	SDL_Window* window = NULL;
	
	SDL_Surface* screenSurface = NULL;

	if (SDL_Init( SDL_INIT_VIDEO ) < 0) {
		printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
	} else {
		window = SDL_CreateWindow( "SDL Tutorial", 
			SDL_WINDOWPOS_UNDEFINED, 
			SDL_WINDOWPOS_UNDEFINED, 
			SCREEN_WIDTH, 
			SCREEN_HEIGHT, 
			SDL_WINDOW_SHOWN
		);
		if( window == NULL ) {
			printf( "Window could not be created! SDL_Error: %s\n", SDL_GetError() );
		} else {
			printf("Created SDL window\n");
			screenSurface = SDL_GetWindowSurface( window );

			SDL_FillRect( screenSurface, NULL, 
				SDL_MapRGB( screenSurface->format, 0xFF, 0xFF, 0xFF ) 
			);
			
			SDL_UpdateWindowSurface( window );

			SDL_Delay( 2000 );
		}
	}

	SDL_DestroyWindow( window );

	SDL_Quit();

	printf("Exiting\n");

	return 0;
}
