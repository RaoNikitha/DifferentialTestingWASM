;; 3. **Test with Backwards Branching in Loop:** Implement a loop where `br` instructions can cause backward jumps within the loop. Within the loop body, place an `unreachable` to check that the WebAssembly execution traps correctly and no backwards branch occurs erroneously past the `unreachable`.

(assert_invalid
  (module (func $type-loop-backward-br-unreachable
    (block (result i32)
      (loop (result i32)
        (block (result i32)
          (unreachable)
          (br 2)
        )
        (f32.const 0)
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)