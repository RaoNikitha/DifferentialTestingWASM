;; 6. Implement a `br_table` with a default case and indices that hit the default path, place a `nop` between the `br_table` and the default handler. This will ensure that `nop` doesn’t affect the default path processing in `br_table`.

(assert_invalid
  (module (func (block $label0 (block $label1 (block $label2
    (br_table $label1 $label2 $label0 (i32.const 3)) (nop) (br $label0)
  )))))
  "unexpected end of code"
)