# Aprende Números y Colores

Aplicación Flutter para Android y iOS que enseña números del 1 al 10 y colores con audio y frases tipo canción.

## Paso a paso de desarrollo
1. **Crear el proyecto base Flutter**: estructura mínima con `pubspec.yaml` y `lib/main.dart`.
2. **Definir contenido educativo**: lista de números 1–10 con colores comunes y una línea de canción para cada color.
3. **Interacción visual**: `PageView` para deslizar entre pantallas y ver cada número/color en pantalla completa.
4. **Audio**: integración de `flutter_tts` para narrar el número, el color y la línea de canción.
5. **Accesibilidad básica**: botón grande “Escuchar” y texto con alto contraste.

## Cómo ejecutar
```bash
flutter pub get
flutter run
```

## Próximos pasos sugeridos
- Agregar audio musical real (archivos `.mp3`) para cada color.
- Incluir imágenes o ilustraciones para reforzar el aprendizaje.
- Añadir modo de juego (seleccionar el color correcto).
