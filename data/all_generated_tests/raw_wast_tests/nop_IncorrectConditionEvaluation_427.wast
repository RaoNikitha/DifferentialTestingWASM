;; Utilize `nop` instructions before a `br_table` and verify if the table lookup and branching occur as specified by the condition.

(assert_invalid
  (module
    (func $nop-before-br-table
      (block $label
        (nop)
        (br_table $label (i32.const 0))))) 
  "type mismatch"
)