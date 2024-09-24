;; 10. Include a block with `br_if` conditioned on multi-valued stack expressions combining addition and subtraction (e.g., stack result zero). Evaluate if branches happen as if the combined result checks are mishandled, exposing complex expression evaluation errors.

(assert_invalid
  (module
    (func $block_with_conditional_br (result i32)
      (block (result i32)
        (i32.const 0)
        (i32.const 1)
        (i32.add)
        (i32.const 1)
        (i32.sub)
        (br_if 0 (i32.eqz))
      )
      (i32.const 42)
    )
  )
  "type mismatch"
)