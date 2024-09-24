;; Use `nop` at a boundary between `call` instruction and a control flow construct such as `block` or `loop`, ensuring types produced by the call do not align with those expected by the subsequent structure. Validate wizard_engine's response.

(assert_invalid
  (module
    (func $invalid-nop-boundary
      (block
        (call $some_function)
        (nop)
      )
    )
    (func $some_function (result f32) (f32.const 0.0))
  )
  "type mismatch"
)