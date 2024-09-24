;; 4. **Test Description**: Test with a structure containing an `if`-`else` block inside a `loop`, where a `br_if` inside the `else` branch should break out to the enclosing `block` action. Validate if incorrect resolution sends control to a different part of the structure.

(assert_invalid
  (module
    (func (block (loop (if (then) (else (br_if 2 (i32.const 1)))))))
  )
  "unexpected break depth"
)