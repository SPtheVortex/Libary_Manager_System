package com.sp.utils;
import java.util.regex.Pattern;
public class PathKit {
    /**
     * 将通配符表达式转化为正则表达式
     * @param path
     * @return
     */
    private static String getRegPath(String path) {
        char[] chars = path.toCharArray();
        int len = chars.length;
        StringBuilder sb = new StringBuilder();
        boolean preX = false;
        for(int i=0;i<len;i++){
            if (chars[i] == '*'){//遇到*字符
                if (preX){//如果是第⼆次遇到*，则将**替换成.*
                    sb.append(".*");
                    preX = false;
                }else if(i+1 == len){//如果是遇到单星，且单星是最后⼀个字符，则直接将*转成[^/]*
                    sb.append("[^/]*");
                }else{//否则单星后⾯还有字符，则不做任何动作，下⼀把再做动作
                    preX = true;
                    continue;
                }
            }else{//遇到⾮*字符
                if (preX){//如果上⼀把是*，则先把上⼀把的*对应的[^/]*添进来
                    sb.append("[^/]*");
                    preX = false;
                }
                if (chars[i] == '?'){//接着判断当前字符是不是?，是的话替换成.
                    sb.append('.');
                }else{//不是?的话，则就是普通字符，直接添进来
                    sb.append(chars[i]);
                }
            }
        }
        return sb.toString();
    }
    /**
     * 通配符模式
     * @param whitePath - ⽩名单地址
     * @param reqPath - 请求地址
     * @return
     */
    private static boolean isMatch(String whitePath, String reqPath) {
        String regPath = getRegPath(whitePath);
        return Pattern.compile(regPath).matcher(reqPath).matches();
    }
    /**
     * 通配符模式
     * @param requestPath - ⽩名单地址
     * @param wildPaths - 请求地址
     * @return
     */
    public static boolean isMatchs(String requestPath, String... wildPaths){
        for (String wildPath : wildPaths){
            if (isMatch(wildPath, requestPath))
                return true;
        }
        return false;
    }
    public static void main(String[] args) {
        System.out.println(isMatchs("/css/eayui.js", "/login.jsp", "/login",
                "/**.css"));
    }
}
