from __future__ import annotations

import os

import pygame
import settings as s

PLAYER = 'Player.png'
PLAYER_ASSET = os.path.join(s.ASSETS_PATH, PLAYER)


class Player(pygame.sprite.Sprite):
    def __init__(self, pos, groups, obstable_sprites):
        super().__init__(groups)
        self.image = pygame.image.load(PLAYER_ASSET).convert_alpha()
        self.rect = self.image.get_rect(topleft=pos)
        self.hitbox = self.rect.inflate(0, -26)

        self.direction = pygame.math.Vector2(0, 0)
        self.speed = 5
        self.obstable_sprites = obstable_sprites

    def input(self):
        keys = pygame.key.get_pressed()

        self.direction.x = keys[pygame.K_RIGHT] - keys[pygame.K_LEFT]
        self.direction.y = keys[pygame.K_DOWN] - keys[pygame.K_UP]

    def move(self, speed):
        if self.direction.magnitude() != 0:
            self.direction = self.direction.normalize()

        self.rect.x += self.direction.x * speed
        self.colision('horizontal')
        self.rect.y += self.direction.y * speed
        self.colision('vertical')

    def colision(self, direction):
        if direction == 'horizontal':
            for sprite in self.obstable_sprites:
                if self.rect.colliderect(sprite):
                    if self.direction.x > 0:
                        self.rect.right = sprite.rect.left
                    elif self.direction.x < 0:
                        self.rect.left = sprite.rect.right
        elif direction == 'vertical':
            for sprite in self.obstable_sprites:
                if self.rect.colliderect(sprite):
                    if self.direction.y > 0:
                        self.rect.bottom = sprite.rect.top
                    elif self.direction.y < 0:
                        self.rect.top = sprite.rect.bottom

    def update(self):
        self.input()
        self.move(self.speed)
