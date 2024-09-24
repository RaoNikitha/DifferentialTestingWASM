;; 9. **Type Confusion with ValTypes**: Implement a loop that mixes different value types (e.g., `i32` and `f32`) and perform stack operations. This ensures the `Wizard Engine` correctly manages stacks within `checkReturnSig` and `push` operation distinctions without corruptions from mismatched types.

(assert_invalid
 (module (func $type-mix-valtypes
  (loop (result i32) (i32.const 1) (f32.const 0.0) drop)
 ))
 "type mismatch"
)