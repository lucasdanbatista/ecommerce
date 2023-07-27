abstract interface class EntityMapper<I, O> {
  O toEntity(I it);
}
