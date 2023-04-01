from __future__ import annotations

import os

import pygame
import settings as s

ROCK = 'Rock.png'
ROCK_ASSET = os.path.join(s.ASSETS_PATH, ROCK)


class Tile(pygame.sprite.Sprite):
    def __init__(self, pos, groups):
        super().__init__(groups)
        self.image = pygame.image.load(ROCK_ASSET).convert_alpha()
        self.rect = self.image.get_rect(topleft=pos)
        self.hitbox = self.rect.inflate(0, -10)
