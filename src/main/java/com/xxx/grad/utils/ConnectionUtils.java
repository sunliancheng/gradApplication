package com.xxx.grad.utils;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ConnectionUtils {

    /**
     *
     * @param relation like "3,4,5,6"
     * @return
     */
    public static Set<Long> parseRelationsToSet(String relation) {
        String[] people = relation.split(",");
        Set<Long> set = new HashSet<>();
        for (String id : people) {
            set.add(Long.valueOf(id));
        }
        return set;
    }

    public static List<Long> parseRelationsToList(String relation) {
        String[] people = relation.split(",");
        List<Long> list = new ArrayList<>();
        for (String id : people) {
            list.add(Long.valueOf(id));
        }
        return list;
    }

    /**
     *
     * @param
     * @return
     */
    public static String toRelation(Set<Long> set) {
        StringBuilder sb = new StringBuilder();
        List<Long> list = new ArrayList<>(set);
        for (int i = 0; i < list.size(); ++i) {
            sb.append(list.get(i));
            if (i != list.size() - 1) sb.append(",");
        }
        return sb.toString();
    }
}
