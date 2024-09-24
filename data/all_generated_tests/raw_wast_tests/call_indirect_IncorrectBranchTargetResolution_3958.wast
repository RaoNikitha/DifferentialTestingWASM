;; 7. **Test Description 7**:    - Develop a WebAssembly test involving `call_indirect` instruction within try-catch blocks with embedded branches (`br_on_exn`). Investigate if the branches resolve correctly, leading the `call_indirect` calls inside exception handling paths, thus differing if branch targets are wrongly resolved.

(assert_invalid
  (module
    (type $sig1 (func (param i32 i32) (result i32)))
    (type $sig2 (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $callee (type $sig1) (param i32 i32) (result i32)
      (i32.add (local.get 0) (local.get 1)))
    (func (type $sig2) (result i32)
      try (param i32) (result i32)
        (call_indirect (type $sig1) (i32.const -1) (i32.const 10) (i32.const 20))
      catch (param i32) (br_on_exn 0 0 (local.get 0)))
    (table 0 funcref)
  )
  "type mismatch"
)