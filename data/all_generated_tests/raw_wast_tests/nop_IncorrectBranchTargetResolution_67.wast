;; Insert `nop` along with `br_if` instructions inside recursive functions to check if `nop` influences the branch target resolution differently in both implementations and if the recursion proceeds as expected.

(assert_invalid
  (module
    (func $recursive (param i32)
      (local i32)
      (block $label
        (br_if $label (i32.eqz (local.get 0)))
        (nop)
        (call $recursive (i32.sub (local.get 0) (i32.const 1)))
      )
    )
  )
  "unknown function"
)