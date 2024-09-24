;; 3. Create a `br_table` instruction with three label targets, an index of four which is out of bounds, and place `nop` instructions interleaved between these operations. This will assess if `nop` disrupts the handling of indices in multi-target `br_table`.

(assert_malformed
  (module
    (func $br_table-test
      block $label0
        block $label1
          block $label2
            nop
            br_table $label0 $label1 $label2 4
            nop
          end
          nop
        end
        nop
      end
    )
  )
  "unknown label"
)